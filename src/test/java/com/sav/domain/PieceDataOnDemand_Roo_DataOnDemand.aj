// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sav.domain;

import com.sav.domain.Piece;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect PieceDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PieceDataOnDemand: @Component;
    
    private Random PieceDataOnDemand.rnd = new SecureRandom();
    
    private List<Piece> PieceDataOnDemand.data;
    
    public Piece PieceDataOnDemand.getNewTransientPiece(int index) {
        Piece obj = new Piece();
        setCodePiece(obj, index);
        setPiece(obj, index);
        setWeight(obj, index);
        return obj;
    }
    
    public void PieceDataOnDemand.setCodePiece(Piece obj, int index) {
        String codePiece = "codePiece_" + index;
        obj.setCodePiece(codePiece);
    }
    
    public void PieceDataOnDemand.setPiece(Piece obj, int index) {
        String piece = "piece_" + index;
        obj.setPiece(piece);
    }
    
    public void PieceDataOnDemand.setWeight(Piece obj, int index) {
        float weight = new Integer(index).floatValue();
        obj.setWeight(weight);
    }
    
    public Piece PieceDataOnDemand.getSpecificPiece(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Piece obj = data.get(index);
        return Piece.findPiece(obj.getId());
    }
    
    public Piece PieceDataOnDemand.getRandomPiece() {
        init();
        Piece obj = data.get(rnd.nextInt(data.size()));
        return Piece.findPiece(obj.getId());
    }
    
    public boolean PieceDataOnDemand.modifyPiece(Piece obj) {
        return false;
    }
    
    public void PieceDataOnDemand.init() {
        data = Piece.findPieceEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Piece' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<com.sav.domain.Piece>();
        for (int i = 0; i < 10; i++) {
            Piece obj = getNewTransientPiece(i);
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