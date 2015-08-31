// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sav.web;

import com.sav.domain.MaterielRma;
import com.sav.domain.Produit;
import com.sav.domain.Rma;
import com.sav.reference.Projet;
import com.sav.reference.Statut;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Arrays;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MaterielRmaController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String MaterielRmaController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("materielrma", MaterielRma.findMaterielRma(id));
        uiModel.addAttribute("itemId", id);
        return "materielrmas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String MaterielRmaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("materielrmas", MaterielRma.findMaterielRmaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) MaterielRma.countMaterielRmas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("materielrmas", MaterielRma.findAllMaterielRmas());
        }
        addDateTimeFormatPatterns(uiModel);
        return "materielrmas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String MaterielRmaController.update(@Valid MaterielRma materielRma, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("materielRma", materielRma);
            addDateTimeFormatPatterns(uiModel);
            return "materielrmas/update";
        }
        uiModel.asMap().clear();
        materielRma.merge();
        return "redirect:/materielrmas/" + encodeUrlPathSegment(materielRma.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String MaterielRmaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("materielRma", MaterielRma.findMaterielRma(id));
        addDateTimeFormatPatterns(uiModel);
        return "materielrmas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String MaterielRmaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MaterielRma.findMaterielRma(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/materielrmas";
    }
    
    @ModelAttribute("materielrmas")
    public Collection<MaterielRma> MaterielRmaController.populateMaterielRmas() {
        return MaterielRma.findAllMaterielRmas();
    }
    
    @ModelAttribute("produits")
    public Collection<Produit> MaterielRmaController.populateProduits() {
        return Produit.findAllProduits();
    }
    
    @ModelAttribute("rmas")
    public Collection<Rma> MaterielRmaController.populateRmas() {
        return Rma.findAllRmas();
    }
    
    @ModelAttribute("projets")
    public Collection<Projet> MaterielRmaController.populateProjets() {
        return Arrays.asList(Projet.class.getEnumConstants());
    }
    
    @ModelAttribute("statuts")
    public Collection<Statut> MaterielRmaController.populateStatuts() {
        return Arrays.asList(Statut.class.getEnumConstants());
    }
    
    void MaterielRmaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("materielRma_datereception_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("materielRma_datereparation_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String MaterielRmaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
