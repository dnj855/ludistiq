# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
require 'cgi'

class BggApiService
  include HTTParty

  # L'URL de base de l'API BGG V2
  base_uri Rails.application.credentials.dig(:bgg, :api_base_url)

  # Méthode pour rechercher des jeux par un nom
  def self.search(query)
    # On ne fait la requête que si la recherche n'est pas vide
    return [] if query.blank?

    options = { query: { type: 'boardgame', query: query } }
    response = get('/search', options)

    # Si la requête échoue, on retourne un tableau vide
    return [] unless response.success?

    doc = Nokogiri::XML(response.body)

    # On parse le XML pour extraire les informations de chaque jeu trouvé
    doc.xpath('//item').map do |item|
      {
        id: item['id'],
        name: item.at_xpath('name')&.[]('value'),
        year: item.at_xpath('yearpublished')&.[]('value')
      }
    end
  end

  # Méthode pour récupérer les détails d'un jeu précis par son ID
  def self.find_game(bgg_id)
    return nil if bgg_id.blank?

    options = { query: { id: bgg_id } }
    response = get('/thing', options)

    return nil unless response.success?

    doc = Nokogiri::XML(response.body)
    item = doc.at_xpath('//item')

    return nil unless item

    # On extrait les détails et on les met en forme pour notre modèle Game
    {
      bgg_id: item['id'],
      title: item.at_xpath('name')&.[]('value'),
      # La description est encodée en HTML, on la décode
      description: CGI.unescapeHTML(item.at_xpath('description')&.text || ''),
      min_players: item.at_xpath('minplayers')&.[]('value'),
      max_players: item.at_xpath('maxplayers')&.[]('value'),
      duration: item.at_xpath('playingtime')&.[]('value'),
      image_url: item.at_xpath('image')&.text
    }
  end
end
