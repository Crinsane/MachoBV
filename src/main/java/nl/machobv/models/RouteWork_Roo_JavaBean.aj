// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.machobv.models;

import java.util.Date;
import nl.machobv.models.City;
import nl.machobv.models.RouteWork;

privileged aspect RouteWork_Roo_JavaBean {
    
    public City RouteWork.getOrigin() {
        return this.origin;
    }
    
    public void RouteWork.setOrigin(City origin) {
        this.origin = origin;
    }
    
    public City RouteWork.getDestination() {
        return this.destination;
    }
    
    public void RouteWork.setDestination(City destination) {
        this.destination = destination;
    }
    
    public double RouteWork.getDelay() {
        return this.delay;
    }
    
    public void RouteWork.setDelay(double delay) {
        this.delay = delay;
    }
    
    public Boolean RouteWork.getClosed() {
        return this.closed;
    }
    
    public void RouteWork.setClosed(Boolean closed) {
        this.closed = closed;
    }
    
    public Date RouteWork.getStart_at() {
        return this.start_at;
    }
    
    public void RouteWork.setStart_at(Date start_at) {
        this.start_at = start_at;
    }
    
    public Date RouteWork.getEnd_at() {
        return this.end_at;
    }
    
    public void RouteWork.setEnd_at(Date end_at) {
        this.end_at = end_at;
    }
    
}