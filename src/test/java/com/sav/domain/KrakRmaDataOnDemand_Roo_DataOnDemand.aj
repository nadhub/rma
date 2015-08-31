// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sav.domain;

import com.sav.domain.AdressRetour;
import com.sav.domain.AdressRetourDataOnDemand;
import com.sav.domain.KrakRma;
import com.sav.reference.ProjectKrakRma;
import com.sav.reference.Transport;
import java.lang.String;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect KrakRmaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: KrakRmaDataOnDemand: @Component;
    
    private Random KrakRmaDataOnDemand.rnd = new SecureRandom();
    
    private List<KrakRma> KrakRmaDataOnDemand.data;
    
    @Autowired
    private AdressRetourDataOnDemand KrakRmaDataOnDemand.adressRetourDataOnDemand;
    
    public KrakRma KrakRmaDataOnDemand.getNewTransientKrakRma(int index) {
        KrakRma obj = new KrakRma();
        setDateOfShipment(obj, index);
        setDeliverySite(obj, index);
        setPackingList(obj, index);
        setProjectName(obj, index);
        setTrackingNumber(obj, index);
        setTransport(obj, index);
        return obj;
    }
    
    public void KrakRmaDataOnDemand.setDateOfShipment(KrakRma obj, int index) {
        Date dateOfShipment = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateOfShipment(dateOfShipment);
    }
    
    public void KrakRmaDataOnDemand.setDeliverySite(KrakRma obj, int index) {
        AdressRetour deliverySite = adressRetourDataOnDemand.getRandomAdressRetour();
        obj.setDeliverySite(deliverySite);
    }
    
    public void KrakRmaDataOnDemand.setPackingList(KrakRma obj, int index) {
        String packingList = "packingList_" + index;
        obj.setPackingList(packingList);
    }
    
    public void KrakRmaDataOnDemand.setProjectName(KrakRma obj, int index) {
        ProjectKrakRma projectName = ProjectKrakRma.class.getEnumConstants()[0];
        obj.setProjectName(projectName);
    }
    
    public void KrakRmaDataOnDemand.setTrackingNumber(KrakRma obj, int index) {
        String trackingNumber = "trackingNumber_" + index;
        obj.setTrackingNumber(trackingNumber);
    }
    
    public void KrakRmaDataOnDemand.setTransport(KrakRma obj, int index) {
        Transport transport = Transport.class.getEnumConstants()[0];
        obj.setTransport(transport);
    }
    
    public KrakRma KrakRmaDataOnDemand.getSpecificKrakRma(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        KrakRma obj = data.get(index);
        return KrakRma.findKrakRma(obj.getId());
    }
    
    public KrakRma KrakRmaDataOnDemand.getRandomKrakRma() {
        init();
        KrakRma obj = data.get(rnd.nextInt(data.size()));
        return KrakRma.findKrakRma(obj.getId());
    }
    
    public boolean KrakRmaDataOnDemand.modifyKrakRma(KrakRma obj) {
        return false;
    }
    
    public void KrakRmaDataOnDemand.init() {
        data = KrakRma.findKrakRmaEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'KrakRma' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<com.sav.domain.KrakRma>();
        for (int i = 0; i < 10; i++) {
            KrakRma obj = getNewTransientKrakRma(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
