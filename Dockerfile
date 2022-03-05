FROM alpine:3.10
COPY start-meilisearch.sh /start-meilisearch.sh
RUN chmod +x /start-meilisearch.sh
ENTRYPOINT ["/start-meilisearch.sh"]
