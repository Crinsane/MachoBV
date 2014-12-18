// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.machobv.models;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import nl.machobv.models.CityDataOnDemand;
import nl.machobv.models.RouteWork;
import nl.machobv.models.RouteWorkDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RouteWorkDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RouteWorkDataOnDemand: @Component;
    
    private Random RouteWorkDataOnDemand.rnd = new SecureRandom();
    
    private List<RouteWork> RouteWorkDataOnDemand.data;
    
    @Autowired
    CityDataOnDemand RouteWorkDataOnDemand.cityDataOnDemand;
    
    public RouteWork RouteWorkDataOnDemand.getNewTransientRouteWork(int index) {
        RouteWork obj = new RouteWork();
        setClosed(obj, index);
        setDelay(obj, index);
        setEnd_at(obj, index);
        setStart_at(obj, index);
        return obj;
    }
    
    public void RouteWorkDataOnDemand.setClosed(RouteWork obj, int index) {
        Boolean closed = Boolean.TRUE;
        obj.setClosed(closed);
    }
    
    public void RouteWorkDataOnDemand.setDelay(RouteWork obj, int index) {
        double delay = new Integer(index).doubleValue();
        obj.setDelay(delay);
    }
    
    public void RouteWorkDataOnDemand.setEnd_at(RouteWork obj, int index) {
        Date end_at = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEnd_at(end_at);
    }
    
    public void RouteWorkDataOnDemand.setStart_at(RouteWork obj, int index) {
        Date start_at = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStart_at(start_at);
    }
    
    public RouteWork RouteWorkDataOnDemand.getSpecificRouteWork(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        RouteWork obj = data.get(index);
        Long id = obj.getId();
        return RouteWork.findRouteWork(id);
    }
    
    public RouteWork RouteWorkDataOnDemand.getRandomRouteWork() {
        init();
        RouteWork obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return RouteWork.findRouteWork(id);
    }
    
    public boolean RouteWorkDataOnDemand.modifyRouteWork(RouteWork obj) {
        return false;
    }
    
    public void RouteWorkDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = RouteWork.findRouteWorkEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'RouteWork' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<RouteWork>();
        for (int i = 0; i < 10; i++) {
            RouteWork obj = getNewTransientRouteWork(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}