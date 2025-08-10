package med.voll.api.domain.medico;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface MedicoRepository extends JpaRepository<Medico, Long> {
    Page<Medico> findAllByAtivoTrue(Pageable paginacao);


    @Query("""
            select m from Medico m
            where
            m.ativo = true
            and
            m.especialidade = :especialidade
            and
            m.id not in(
                select c.medico.id from Consulta c
                where
                c.data = :data
                and
                c.motivoCancelamento is null
            )
        """)
    List<Medico> escolherMedicoAleatorioLivreNaData(Especialidade especialidade, LocalDateTime data, Pageable pageable);

    default Medico escolherMedicoAleatorioLivreNaData(Especialidade especialidade, LocalDateTime data) {
        var pageable = PageRequest.of(0, 1);
        return escolherMedicoAleatorioLivreNaData(especialidade, data, pageable).stream().findFirst().orElse(null);
    }

    @Query("""
            select m.ativo
            from Medico m
            where
            m.id = :id
            """)
    Boolean findAtivoById(Long id);
}
