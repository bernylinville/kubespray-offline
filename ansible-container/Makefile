NAME = kubespray-offline-ansible

PROXY = --build-arg http_proxy=http://10.0.12.103:7890 --build-arg https_proxy=http://10.0.12.103:7890

all: Dockerfile
	nerdctl image build $(PROXY) -t $(NAME) .

rmi:
	nerdctl image rmi $(NAME)

bash:
	nerdctl container run -it --rm $(NAME) /bin/bash

save:  $(NAME).tar.gz

$(NAME).tar.gz:
	nerdctl image save $(NAME):latest | gzip > $(NAME).tar.gz
	chmod 644 $(NAME).tar.gz

clean:
	-/bin/rm $(NAME).tar.gz
