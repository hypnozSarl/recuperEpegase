package recuperation.repository;

import com.yewi.yewicore.recuperation.domain.PayFeuilleCalculRubrique;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PayFeuilleCalculRubriqueRepository extends JpaRepository<PayFeuilleCalculRubrique, Long>, JpaSpecificationExecutor<PayFeuilleCalculRubrique> {

}