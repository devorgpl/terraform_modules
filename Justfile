k3s-reset:
  sudo /usr/local/bin/k3s-killall.sh
  sudo /usr/local/bin/k3s-uninstall.sh
  curl -sfL https://get.k3s.io | sh -
  # export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
  # ln -s ^^
  sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
