FROM scratch
COPY . .
RUN ./docker/run-hobby.sh
