package recuperation.vo;


import lombok.Data;

import java.io.Serializable;

@Data
public class UtilisateursModulesesQueryVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long utilisateurId;

    private String modulesesCode;

}
