// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.machobv.models;

import nl.machobv.models.City;
import nl.machobv.models.Route;

privileged aspect Route_Roo_JavaBean {
    
    public City Route.getOrigin() {
        return this.origin;
    }
    
    public void Route.setOrigin(City origin) {
        this.origin = origin;
    }
    
    public City Route.getDestination() {
        return this.destination;
    }
    
    public void Route.setDestination(City destination) {
        this.destination = destination;
    }
    
    public double Route.getDistance() {
        return this.distance;
    }
    
    public void Route.setDistance(double distance) {
        this.distance = distance;
    }
    
    public double Route.getDuration() {
        return this.duration;
    }
    
    public void Route.setDuration(double duration) {
        this.duration = duration;
    }
    
}
