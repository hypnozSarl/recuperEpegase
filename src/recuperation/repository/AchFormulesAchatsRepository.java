package recuperation.repository;

import com.yewi.yewicore.recuperation.domain.AchFormulesAchats;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface AchFormulesAchatsRepository extends JpaRepository<AchFormulesAchats, Long>, JpaSpecificationExecutor<AchFormulesAchats> {

}