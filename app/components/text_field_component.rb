# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  attr_reader :form, :method, :label, :options

  def initialize(form:, method:, label:, **options)
    @form = form
    @method = method
    @label = label
    @options = options
  end

  private

  # NOUVEAU : Méthode pour vérifier la présence d'erreurs pour ce champ.
  def has_errors?
    form.object.errors.include?(method)
  end

  # NOUVEAU : Méthode pour récupérer le premier message d'erreur.
  def error_message
    form.object.errors.full_messages_for(method).first
  end

  # MODIFIÉ : La méthode des classes est maintenant plus intelligente.
  def field_classes
    default_classes = 'block w-full rounded-md border-0 py-1.5 shadow-sm sm:text-sm sm:leading-6'

    if has_errors?
      # Classes en cas d'erreur, basées sur ton DESIGN_SYSTEM.md
      error_classes = 'text-rose-900 ring-1 ring-inset ring-rose-300 placeholder:text-rose-300 focus:ring-2 focus:ring-inset focus:ring-rose-500'
      [default_classes, error_classes].join(' ')
    else
      # Classes par défaut
      normal_classes = 'text-slate-900 ring-1 ring-inset ring-slate-300 placeholder:text-slate-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600'
      [default_classes, normal_classes].join(' ')
    end
  end
end
