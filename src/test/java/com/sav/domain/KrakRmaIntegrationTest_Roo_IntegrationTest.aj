// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sav.domain;

import com.sav.domain.KrakRmaDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect KrakRmaIntegrationTest_Roo_IntegrationTest {
    
    declare @type: KrakRmaIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: KrakRmaIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: KrakRmaIntegrationTest: @Transactional;
    
    @Autowired
    private KrakRmaDataOnDemand KrakRmaIntegrationTest.dod;
    
    @Test
    public void KrakRmaIntegrationTest.testCountKrakRmas() {
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", dod.getRandomKrakRma());
        long count = com.sav.domain.KrakRma.countKrakRmas();
        org.junit.Assert.assertTrue("Counter for 'KrakRma' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void KrakRmaIntegrationTest.testFindKrakRma() {
        com.sav.domain.KrakRma obj = dod.getRandomKrakRma();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to provide an identifier", id);
        obj = com.sav.domain.KrakRma.findKrakRma(id);
        org.junit.Assert.assertNotNull("Find method for 'KrakRma' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'KrakRma' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void KrakRmaIntegrationTest.testFindAllKrakRmas() {
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", dod.getRandomKrakRma());
        long count = com.sav.domain.KrakRma.countKrakRmas();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'KrakRma', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.sav.domain.KrakRma> result = com.sav.domain.KrakRma.findAllKrakRmas();
        org.junit.Assert.assertNotNull("Find all method for 'KrakRma' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'KrakRma' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void KrakRmaIntegrationTest.testFindKrakRmaEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", dod.getRandomKrakRma());
        long count = com.sav.domain.KrakRma.countKrakRmas();
        if (count > 20) count = 20;
        java.util.List<com.sav.domain.KrakRma> result = com.sav.domain.KrakRma.findKrakRmaEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'KrakRma' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'KrakRma' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void KrakRmaIntegrationTest.testFlush() {
        com.sav.domain.KrakRma obj = dod.getRandomKrakRma();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to provide an identifier", id);
        obj = com.sav.domain.KrakRma.findKrakRma(id);
        org.junit.Assert.assertNotNull("Find method for 'KrakRma' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyKrakRma(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'KrakRma' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void KrakRmaIntegrationTest.testMerge() {
        com.sav.domain.KrakRma obj = dod.getRandomKrakRma();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to provide an identifier", id);
        obj = com.sav.domain.KrakRma.findKrakRma(id);
        boolean modified =  dod.modifyKrakRma(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.sav.domain.KrakRma merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'KrakRma' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void KrakRmaIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", dod.getRandomKrakRma());
        com.sav.domain.KrakRma obj = dod.getNewTransientKrakRma(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'KrakRma' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'KrakRma' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void KrakRmaIntegrationTest.testRemove() {
        com.sav.domain.KrakRma obj = dod.getRandomKrakRma();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'KrakRma' failed to provide an identifier", id);
        obj = com.sav.domain.KrakRma.findKrakRma(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'KrakRma' with identifier '" + id + "'", com.sav.domain.KrakRma.findKrakRma(id));
    }
    
}