FROM python:3.11-slim
# используйте образ, который скачали в прошлом уроке
# и в котором уже установлен Python

LABEL author=${AUTHOR}
# добавьте label, используя переменную среды

COPY . ./churn_app
# скопируйте файлы в Docker
# название директории внутри контейнера: churn_app

WORKDIR churn_app
# измените рабочую директорию Docker  

RUN pip3 install -r requirements.txt
# инструкция для установки библиотек

EXPOSE ${APP_PORT}
# инструкция для открытия порта
# используйте порт, который указан в Readme

VOLUME /models
# примонтируйте том с моделями

CMD uvicorn app.churn_app:app --reload --host 0.0.0.0 --port ${APP_PORT}
# какая команда должна исполняться при старте контейнера?