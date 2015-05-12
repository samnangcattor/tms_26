module ApplicationHelper
  def full_title page_title = ''
    base_title = "Framgia Training System"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def link_to_add_fields label, f, assoc
    new_obj = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for assoc, new_obj,child_index: "new_#{assoc}" do |builder|
      render "#{assoc.to_s.singularize}_fields", f: builder
    end

    link_to label, "#", onclick: "add_fields(this, \"#{assoc}\", \"#{escape_javascript(fields)}\")", remote: true
  end
  def link_to_remove_fields label, f
    field = f.hidden_field :_destroy
    link = link_to label, "#", onclick: "remove_fields(this)", remote: true
    field + link
  end
end
