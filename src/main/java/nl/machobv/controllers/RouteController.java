package nl.machobv.controllers;
import nl.machobv.models.Route;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/routes")
@Controller
@RooWebScaffold(path = "routes", formBackingObject = Route.class)
@RooWebFinder
public class RouteController {
}
