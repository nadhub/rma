// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sav.domain;

import com.sav.domain.Produit;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Produit_Roo_Entity {
    
    declare @type: Produit: @Entity;
    
    @PersistenceContext
    transient EntityManager Produit.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Produit.id;
    
    @Version
    @Column(name = "version")
    private Integer Produit.version;
    
    public Long Produit.getId() {
        return this.id;
    }
    
    public void Produit.setId(Long id) {
        this.id = id;
    }
    
    public Integer Produit.getVersion() {
        return this.version;
    }
    
    public void Produit.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Produit.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Produit.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Produit attached = Produit.findProduit(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Produit.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Produit.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Produit Produit.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Produit merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Produit.entityManager() {
        EntityManager em = new Produit().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Produit.countProduits() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Produit o", Long.class).getSingleResult();
    }
    
    public static Produit Produit.findProduit(Long id) {
        if (id == null) return null;
        return entityManager().find(Produit.class, id);
    }
    
    public static List<Produit> Produit.findProduitEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Produit o", Produit.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
