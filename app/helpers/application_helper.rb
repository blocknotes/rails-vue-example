module ApplicationHelper
  def slim_comp_render( comp )
    Slim::Template
      .new( Rails.application.config.components_path.join( comp ) )
      .render
      .gsub( '"', '\"' )
  end
end
