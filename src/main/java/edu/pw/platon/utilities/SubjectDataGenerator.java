package edu.pw.platon.utilities;

import edu.pw.platon.studies.*;
import edu.pw.platon.teacher.Teacher;
import edu.pw.platon.teacher.TeacherRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

public class SubjectDataGenerator {

    private final SubjectRepository subjectRepository;
    private final RealisationRepository realisationRepository;
    private final PassMethodRepository passMethodRepository;
    private final TeacherRepository teacherRepository;

    public SubjectDataGenerator(SubjectRepository subjectRepository, RealisationRepository realisationRepository, PassMethodRepository passMethodRepository, TeacherRepository teacherRepository) {
        this.subjectRepository = subjectRepository;
        this.realisationRepository = realisationRepository;
        this.passMethodRepository = passMethodRepository;
        this.teacherRepository = teacherRepository;
    }

    @Transactional
    public PassMethod createPassMethodIfNotFound(String passType, String description) {
        PassMethod passMethod = passMethodRepository.findOne(passType);
        if (passMethod == null) {
            passMethod = new PassMethod();
            passMethod.setName(passType);
            passMethod.setDescription(description);
            passMethodRepository.save(passMethod);
        }
        return passMethod;
    }

    @Transactional
    public List<Realisation> createRealisationsIfNotFound(Subject subject, String semesterCode) {
        List<Realisation> realisations = realisationRepository.findBySubjectAndSemesterCode(subject, semesterCode);
        if (realisations.isEmpty()) {
            Realisation rA = new Realisation();
            Realisation rB = new Realisation();
            rA.setSubject(subject);
            rB.setSubject(subject);
            rA.setName("A");
            rB.setName("B");
            rA.setSemesterCode(semesterCode);
            rB.setSemesterCode(semesterCode);
            rA.setTeachers(new HashSet<>());
            rB.setTeachers(new HashSet<>());
            realisationRepository.save(rA);
            realisationRepository.save(rB);
            return Arrays.asList(rA, rB);
        }
        return realisations;
    }

    @Transactional
    public Subject createSubjectIfNotFound(String code, String name, int ects, PassMethod passMethod, String description) {
        Subject subject = subjectRepository.findOne(code);
        if (subject == null) {
            subject = new Subject();
            subject.setCode(code);
            subject.setName(name);
            subject.setEcts(ects);
            subject.setPassMethod(passMethod);
            subject.setDescription(description);
            subjectRepository.save(subject);
        }
        return subject;
    }

    @Transactional
    public void insertSubjectsAndRealisations() {
        PassMethod examPass = createPassMethodIfNotFound("E", "Egzamin podczas sesji egzaminacyjnej");
        Subject subject = createSubjectIfNotFound("MAD", "Matematyka dyskretna", 3, examPass,
                "Kombinatoryka, grafy, dowodzenie twierdzeń grafowych");
        List<Realisation> realisations = createRealisationsIfNotFound(subject, "18L");
        Teacher teacherA = teacherRepository.findByUsername("teacher1");
        Teacher teacherB = teacherRepository.findByUsername("teacher2");
        teacherA.setRealisations(Arrays.asList(realisations.get(0)));
        teacherB.setRealisations(Arrays.asList(realisations.get(1)));
        teacherRepository.save(teacherA);
        teacherRepository.save(teacherB);
    }
}
