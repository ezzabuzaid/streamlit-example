FROM python:3.9-slim AS base
RUN apt-get update && apt-get install -y build-essential curl software-properties-common git
RUN rm -rf /var/lib/apt/lists/*


FROM base AS start
WORKDIR /app
COPY . .
ENV PORT=8501
RUN pip3 install -r requirements.txt
EXPOSE 8501
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py", "--server.port=8501", "--server.address=0.0.0.0"]