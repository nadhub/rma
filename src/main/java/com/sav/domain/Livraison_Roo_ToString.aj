// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sav.domain;

import java.lang.String;

privileged aspect Livraison_Roo_ToString {
    
    public String Livraison.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DateLivraison: ").append(getDateLivraison()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("LivGenereNumber: ").append(getLivGenereNumber()).append(", ");
        sb.append("MaterielRma: ").append(getMaterielRma()).append(", ");
        sb.append("Reference: ").append(getReference()).append(", ");
        sb.append("TrackingNumber: ").append(getTrackingNumber()).append(", ");
        sb.append("Transport: ").append(getTransport()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
