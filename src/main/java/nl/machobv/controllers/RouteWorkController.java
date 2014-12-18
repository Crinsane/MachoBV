package nl.machobv.controllers;
import nl.machobv.models.RouteWork;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/routeworks")
@Controller
@RooWebScaffold(path = "routeworks", formBackingObject = RouteWork.class)
@RooWebFinder
public class RouteWorkController {
}
