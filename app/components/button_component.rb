# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  # On définit les styles possibles pour nos boutons
  STYLES = {
    primary: 'text-white bg-indigo-600 hover:bg-indigo-700 focus-visible:outline-indigo-600',
    secondary: 'text-slate-900 bg-white ring-1 ring-inset ring-slate-300 hover:bg-slate-50',
    destructive: 'text-white bg-rose-600 hover:bg-rose-700 focus-visible:outline-rose-600'
  }.freeze

  # L'initialiseur est le "constructeur" de notre composant.
  # - path: Si on passe une URL, le bouton sera un lien (<a>). Sinon, une balise <button>.
  # - style: Le style visuel (:primary, :secondary, etc.).
  # - options: Un hash pour passer n'importe quel autre attribut HTML (id, data-*, etc.).
  def initialize(path: nil, style: :primary, **options)
    @path = path
    @style = style
    @options = options
  end

  private

  # On fusionne les classes CSS de base (communes à tous les boutons)
  # avec les classes spécifiques au style choisi.
  def classes
    common_classes = 'inline-flex items-center justify-center rounded-md px-4 py-2 text-sm font-semibold shadow-sm transition-colors focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 disabled:opacity-50 disabled:cursor-not-allowed'
    [common_classes, STYLES.fetch(@style.to_sym)].join(' ')
  end

  # Cette méthode détermine si on doit rendre une balise <a> ou <button>.
  def tag_type
    @path.present? ? :a : :button
  end
end
