// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sav.domain;

import java.lang.String;

privileged aspect KrakRma_Roo_ToString {
    
    public String KrakRma.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DateOfShipment: ").append(getDateOfShipment()).append(", ");
        sb.append("DeliverySite: ").append(getDeliverySite()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("PackingList: ").append(getPackingList()).append(", ");
        sb.append("ProjectName: ").append(getProjectName()).append(", ");
        sb.append("RmaKrakGenereNumber: ").append(getRmaKrakGenereNumber()).append(", ");
        sb.append("TrackingNumber: ").append(getTrackingNumber()).append(", ");
        sb.append("Transport: ").append(getTransport()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
