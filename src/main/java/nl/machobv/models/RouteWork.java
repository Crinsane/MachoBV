package nl.machobv.models;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findRouteWorksByOriginAndDestinationAndStart_atLessThanEqualsAndEnd_atGreaterThanEquals" })
public class RouteWork {

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
    private double delay;

    /**
     */
    private Boolean closed;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "F-")
    private Date start_at;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "F-")
    private Date end_at;
}
