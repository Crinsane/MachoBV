// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.machobv.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import nl.machobv.models.City;

privileged aspect City_Roo_Jpa_Entity {
    
    declare @type: City: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long City.id;
    
    @Version
    @Column(name = "version")
    private Integer City.version;
    
    public Long City.getId() {
        return this.id;
    }
    
    public void City.setId(Long id) {
        this.id = id;
    }
    
    public Integer City.getVersion() {
        return this.version;
    }
    
    public void City.setVersion(Integer version) {
        this.version = version;
    }
    
}
