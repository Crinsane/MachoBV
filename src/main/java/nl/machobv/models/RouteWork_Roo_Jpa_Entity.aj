// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.machobv.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import nl.machobv.models.RouteWork;

privileged aspect RouteWork_Roo_Jpa_Entity {
    
    declare @type: RouteWork: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long RouteWork.id;
    
    @Version
    @Column(name = "version")
    private Integer RouteWork.version;
    
    public Long RouteWork.getId() {
        return this.id;
    }
    
    public void RouteWork.setId(Long id) {
        this.id = id;
    }
    
    public Integer RouteWork.getVersion() {
        return this.version;
    }
    
    public void RouteWork.setVersion(Integer version) {
        this.version = version;
    }
    
}
