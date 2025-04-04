package recuperation.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity
@Table(name = "groupes_moduleses")
public class GroupesModuleses implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "groupes_id", nullable = false)
    private Long groupesId;

    @Id
    @Column(name = "moduleses_code", nullable = false)
    private String modulesesCode;

}
