FROM python:3
ADD myapp/requirements.txt /
ADD myapp/hello.py /
RUN pip install -r requirements.txt
CMD [ "python", "./hello.py" ]