module PagesHelper
    def display_check_in_dropdown_item (locale)
        if (I18n.locale == locale.to_sym)
            return content_tag(:div, class: "inline-block align-baseline") do
                content_tag(:svg, width: "16", height: "16", viewBox: "0 0 16 16", fill: "#F9253F") do
                    tag(:path, "fill-rule": "evenodd", "clip-rule": "evenodd", d: "M6.611 10.502L3.723 7.521a1.009 1.009 0 0 0-1.414-.03.98.98 0 0 0-.032 1.396l3.69 3.808c.423.436 1.138.4 1.513-.077l6.31-8.025a.98.98 0 0 0-.177-1.385 1.008 1.008 0 0 0-1.403.174l-5.599 7.12z")
                end
            end
        else 
            return ""
        end
    end

    def display_locale_dropdown_item (name, locale)
        link_to controller: "pages", action: "update_locale", locale: locale do
            content_tag(:div, class: "px-4 py-1 hover:bg-neutral-100 text-left flex") do
                content_tag(:div, display_check_in_dropdown_item(locale), class: "basis-1/5") +
                content_tag(:div, name, class: "basis-4/5 ")
            end
        end
    end

    def language_tag(locale)
        case (locale)
        when :en
            "Eng"
        when :fr
            "Fra"
        when :ru
            "Рус"
        when :uk
            "Укр"
        else
            "Eng"
        end
    end
end
