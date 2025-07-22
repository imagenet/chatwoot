FROM chatwoot:development

ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

COPY ./docker/entrypoints/rails.sh /docker/entrypoints/rails.sh
RUN chmod +x /docker/entrypoints/rails.sh

EXPOSE 3000
ENTRYPOINT ["/docker/entrypoints/rails.sh"]
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
