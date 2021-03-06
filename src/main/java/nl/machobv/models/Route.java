package nl.machobv.models;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findRoutesByOriginAndDestination" })
public class Route {

    /**
     */
    @ManyToOne
    private City origin;

    /**
     */
    @ManyToOne
    private City destination;

    /**
     */
    private double distance;

    /**
     */
    private double duration;
}
