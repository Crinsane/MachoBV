// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.machobv.controllers;

import nl.machobv.controllers.RouteController;
import nl.machobv.models.City;
import nl.machobv.models.Route;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RouteController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByOriginAndDestination", "form" }, method = RequestMethod.GET)
    public String RouteController.findRoutesByOriginAndDestinationForm(Model uiModel) {
        uiModel.addAttribute("citys", City.findAllCitys());
        uiModel.addAttribute("citys", City.findAllCitys());
        return "routes/findRoutesByOriginAndDestination";
    }
    
    @RequestMapping(params = "find=ByOriginAndDestination", method = RequestMethod.GET)
    public String RouteController.findRoutesByOriginAndDestination(@RequestParam("origin") City origin, @RequestParam("destination") City destination, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("routes", Route.findRoutesByOriginAndDestination(origin, destination, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Route.countFindRoutesByOriginAndDestination(origin, destination) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("routes", Route.findRoutesByOriginAndDestination(origin, destination, sortFieldName, sortOrder).getResultList());
        }
        return "routes/list";
    }
    
}
