package recuperation.vo;


import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class CptBudgetTresorerieQueryVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long budId;


    /**
     * date de creation
     */
    private LocalDateTime budDateCreat;


    /**
     * date de modification
     */
    private LocalDateTime budDateModif;


    /**
     * utilisateur de creation
     */
    private Long budUserCreat;


    /**
     * utilisateur de modification
     */
    private Long budUserModif;


    /**
     * code projet
     */
    private String budProjet;


    /**
     * annee de definition
     */
    private String budAnnee;


    /**
     * code budget
     */
    private String budCode;


    /**
     * libelle du budget en FR
     */
    private String budLibelleFr;


    /**
     * libelle du budget en UK
     */
    private String budLibelleUk;


    /**
     * libelle du budget en SP
     */
    private String budLibelleSp;


    /**
     * 0=encaissement 1=decaissement
     */
    private Integer budSens;


    /**
     * defini le dernier budget utilise (de 1 a  4)
     */
    private Integer budUtil;


    /**
     * valeur initiale
     */
    private Double bud01TotVal;


    /**
     * valeur reamenagement 2
     */
    private Double bud02TotVal;


    /**
     * valeur reamenagement 3
     */
    private Double bud03TotVal;


    /**
     * valeur reamenagement 4
     */
    private Double bud04TotVal;


    /**
     * janvier reamenagement 1
     */
    private Double bud01R1Val;


    /**
     * fevrier reamenagement 1
     */
    private Double bud02R1Val;


    /**
     * mars reamenagement 1
     */
    private Double bud03R1Val;


    /**
     * avril reamenagement 1
     */
    private Double bud04R1Val;


    /**
     * mai reamenagement 1
     */
    private Double bud05R1Val;


    /**
     * juin reamenagement 1
     */
    private Double bud06R1Val;


    /**
     * juillet reamenagement 1
     */
    private Double bud07R1Val;


    /**
     * aout reamenagement 1
     */
    private Double bud08R1Val;


    /**
     * septembre reamenagement 1
     */
    private Double bud09R1Val;


    /**
     * octobre reamenagement 1
     */
    private Double bud10R1Val;


    /**
     * novembre reamenagement 1
     */
    private Double bud11R1Val;


    /**
     * decembre reamenagement 1
     */
    private Double bud12R1Val;


    /**
     * janvier reamenagement 2
     */
    private Double bud01R2Val;


    /**
     * fevrier reamenagement 2
     */
    private Double bud02R2Val;


    /**
     * mars reamenagement 2
     */
    private Double bud03R2Val;


    /**
     * avril reamenagement 2
     */
    private Double bud04R2Val;


    /**
     * mai reamenagement 2
     */
    private Double bud05R2Val;


    /**
     * juin reamenagement 2
     */
    private Double bud06R2Val;


    /**
     * juillet reamenagement 2
     */
    private Double bud07R2Val;


    /**
     * aout reamenagement 2
     */
    private Double bud08R2Val;


    /**
     * septembre reamenagement v
     */
    private Double bud09R2Val;


    /**
     * octobre reamenagement 2
     */
    private Double bud10R2Val;


    /**
     * novembre reamenagement 2
     */
    private Double bud11R2Val;


    /**
     * decembre reamenagement 2
     */
    private Double bud12R2Val;


    /**
     * janvier reamenagement 3
     */
    private Double bud01R3Val;


    /**
     * fevrier reamenagement 3
     */
    private Double bud02R3Val;


    /**
     * mars reamenagement 3
     */
    private Double bud03R3Val;


    /**
     * avril reamenagement 3
     */
    private Double bud04R3Val;


    /**
     * mai reamenagement 3
     */
    private Double bud05R3Val;


    /**
     * juin reamenagement 3
     */
    private Double bud06R3Val;


    /**
     * juillet reamenagement 3
     */
    private Double bud07R3Val;


    /**
     * aout reamenagement 3
     */
    private Double bud08R3Val;


    /**
     * septembre reamenagement 3
     */
    private Double bud09R3Val;


    /**
     * octobre reamenagement 3
     */
    private Double bud10R3Val;


    /**
     * novembre reamenagement 3
     */
    private Double bud11R3Val;


    /**
     * decembre reamenagement 3
     */
    private Double bud12R3Val;


    /**
     * janvier reamenagement 4
     */
    private Double bud01R4Val;


    /**
     * fevrier reamenagement 4
     */
    private Double bud02R4Val;


    /**
     * mars reamenagement 4
     */
    private Double bud03R4Val;


    /**
     * avril reamenagement 4
     */
    private Double bud04R4Val;


    /**
     * mai reamenagement 4
     */
    private Double bud05R4Val;


    /**
     * juin reamenagement 4
     */
    private Double bud06R4Val;


    /**
     * juillet reamenagement 4
     */
    private Double bud07R4Val;


    /**
     * aout reamenagement 4
     */
    private Double bud08R4Val;


    /**
     * septembre reamenagement 4
     */
    private Double bud09R4Val;


    /**
     * octobre reamenagement 4
     */
    private Double bud10R4Val;


    /**
     * novembre reamenagement 4
     */
    private Double bud11R4Val;


    /**
     * decembre reamenagement 4
     */
    private Double bud12R4Val;

    private Long execptId;

}
