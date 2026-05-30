FROM python:3.11-slim

LABEL author=${AUTHOR}
COPY . ./simple_fast_api
WORKDIR simple_fast_api 

# директория simple_fast_api скопирована в Docker

RUN pip3 install -r requirements.txt
# устанавливаем библиотеки из файла requirements.txt
# который ранее был скопирован инструкцией COPY . ./simple_fast_api
# вместе со всем содержимым текущей директории в simple_fast_api

VOLUME /speeches
# указываем, что директория speeches внутри контейнера будет являться томом
# на этапе сборки docker создаст необходимые файлы на самой виртуальной машине
# в директории /var/lib/docker/volumes/

EXPOSE ${APP_PORT}
# эта инструкция указывает образу, 
# что порт 1702 должен быть открыт 'снаружи'

# укажем инструкцию по запуску микросервиса
CMD uvicorn app.main:app --host  0.0.0.0 --port ${APP_PORT}