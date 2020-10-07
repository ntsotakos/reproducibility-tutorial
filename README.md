# reproducibility-tutorial
# Tutorial for FOSS 2020 online
  
#Computer Setup 
	#download the Miniconda installer
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

	#install Miniconda silently (-b) in path (-p) /opt/conda
	bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda

	#make sure all conda packages are in path by symbolic links to /bin
	ln -s /opt/conda/pkgs/*/bin/* /bin
	ln -s /opt/conda/pkgs/*/lib/* /usr/lib

	#install Jupyter Lab v.1.2.3
	/opt/conda/bin/conda install -c conda-forge -y jupyterlab=1.2.3
	/opt/conda/bin/conda install -c conda-forge -y nodejs=10.13.0


 	/opt/conda/bin/pip install bash_kernel
	/opt/conda/bin/pip install ipykernel
	/opt/conda/bin/python3 -m bash_kernel.install

	#Test Jupyter Lab
	/opt/conda/bin/jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='' --notebook-dir='/scratch/reproducibility-tutorial/'
	
	#Install Snakemake v.5.8.1
	/opt/conda/bin/conda install -c bioconda -c conda-forge -y snakemake=5.8.1

	#Install Docker
		##update Ubuntu apt-get manager
	sudo apt-get update

		##install needed packages
	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	
		##add the Docker key
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

		##add the repo
	sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

		##update apt-get with new repo info
	sudo apt-get update

		##install docker
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io

		##test docker
	docker run hello-world
 
