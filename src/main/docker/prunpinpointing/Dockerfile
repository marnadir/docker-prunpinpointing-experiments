FROM openjdk:8u151-jdk

ENV CLASSPATH 'maven/*'
ENV EL2MCS_DIR el2mcs
ENV EL2MUS_DIR el2mus
ENV SATPIN_EXE SATPin

ENV JAVA_MEMORY_OPTIONS '-Xmx6G -Xms2G'

WORKDIR /home/pinpointing

COPY . /home/pinpointing

RUN apt-get update && apt-get install -y --no-install-recommends \
		bc \
		r-base-core \
	&& rm -rf /var/lib/apt/lists/*

ARG PORT=3030
ENV PORT $PORT

EXPOSE $PORT

# Must be in the shell form so that the variable substitution works
CMD java -cp 'maven/*' org.liveontologies.pinpointing.ExperimentServer --port $PORT --exps available_experiments --workspace workspace \
	./scripts/run_ELK-SAT_experiments.sh '<t>' '<g>' '<s>' '<o>' docker scripts workspace '<q>' '<j>'
