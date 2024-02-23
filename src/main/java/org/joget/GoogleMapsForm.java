package org.joget;

import java.util.Map;
import org.joget.apps.app.service.AppPluginUtil;
import org.joget.apps.app.service.AppUtil;
import org.joget.apps.form.lib.CustomHTML;
import org.joget.apps.form.model.FormBuilderPalette;
import org.joget.apps.form.model.FormData;
import org.joget.apps.form.service.FormUtil;

public class GoogleMapsForm extends CustomHTML {
    private final static String MESSAGE_PATH = "message/form/googleMapsForm";

    @Override
    public String getName() {
        return "Google Maps Form";
    }

    @Override
    public String getVersion() {
        return "8.0";
    }

    @Override
    public String getClassName() {
        return getClass().getName();
    }

    @Override
    public String getFormBuilderCategory() {
        return FormBuilderPalette.CATEGORY_CUSTOM;
    }

    @Override
    public String getLabel() {
        // support i18n
        return AppPluginUtil.getMessage("org.joget.GoogleMapsForm.pluginLabel", getClassName(), MESSAGE_PATH);
    }

    @Override
    public String getDescription() {
        // support i18n
        return AppPluginUtil.getMessage("org.joget.GoogleMapsForm.pluginDesc", getClassName(), MESSAGE_PATH);
    }

    @Override
    public String getPropertyOptions() {
        return AppUtil.readPluginResource(getClass().getName(), "/properties/googleMapsForm.json", null, true,
                MESSAGE_PATH);
    }

    @Override
    public String getFormBuilderTemplate() {
        return "<label class='label'>" + getLabel() + "</label>";
    }

    @Override
    public String renderTemplate(FormData formData, Map dataModel) {
        String template = "googleMapsForm.ftl";

        // set value
        String value = FormUtil.getElementPropertyValue(this, formData);
        dataModel.put("value", value);
        String html = FormUtil.generateElementHtml(this, formData, template, dataModel);
        return html;
    }
}
