{% set k3s_token = salt['pillar.get']('k3s:token') %}

k3s_setup1:
  cmd.run:
    - name: "curl -sfL 'https://get.k3s.io' | sh -s - server --token {{ k3s_token }}"

k3s_setup2:
  cmd.run:
    - name: "while [ ! -f /tmp/K3s-Ready ]; do kubectl get nodes | grep Ready; if [ $? -eq 0 ]; then touch /tmp/K3s-Ready; fi; done"

k3s_setup3:
  cmd.run: 
    - name: "/usr/local/bin/register-rancher.sh"
    - onlyif:
      - test -f /tmp/K3s-Ready