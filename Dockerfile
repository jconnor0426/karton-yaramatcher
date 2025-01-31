FROM python:3.7

RUN useradd -m insikt 
WORKDIR /app/service
COPY ./requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY ./README.md ./README.md
COPY ./karton ./karton
COPY ./setup.py ./setup.py
RUN pip install .
COPY ./rules ./rules
RUN chown -R insikt /app/service
USER insikt
CMD karton-yaramatcher --rules ./rules
