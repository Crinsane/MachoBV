// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.machobv.controllers;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import nl.machobv.controllers.CityController;
import nl.machobv.models.City;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CityController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CityController.create(@Valid City city, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, city);
            return "citys/create";
        }
        uiModel.asMap().clear();
        city.persist();
        return "redirect:/citys/" + encodeUrlPathSegment(city.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CityController.createForm(Model uiModel) {
        populateEditForm(uiModel, new City());
        return "citys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CityController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("city", City.findCity(id));
        uiModel.addAttribute("itemId", id);
        return "citys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CityController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("citys", City.findCityEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) City.countCitys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("citys", City.findAllCitys(sortFieldName, sortOrder));
        }
        return "citys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CityController.update(@Valid City city, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, city);
            return "citys/update";
        }
        uiModel.asMap().clear();
        city.merge();
        return "redirect:/citys/" + encodeUrlPathSegment(city.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CityController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, City.findCity(id));
        return "citys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CityController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        City city = City.findCity(id);
        city.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/citys";
    }
    
    void CityController.populateEditForm(Model uiModel, City city) {
        uiModel.addAttribute("city", city);
    }
    
    String CityController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
