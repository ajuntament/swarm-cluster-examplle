Bootstrap first with fullstack.

Here we've 3 configs:
  - Single traefik container + bootstrap as a Docker Swarm Service exposing ports 80, 443 and 8080 ---> Debug issues
  - 3 node cluster + bootstrap ---> Setup ( stack.yaml is a link )
  - 3 node cluster without bootstrap ---> Production

You only need to run bootstrap once to populate consul. Stacks including traefik_init do it on their own. Just run them again if you messed up traefik's config.

Heavy Issues & voodoo with Letsencrypt certificates and HA-mode.

Remember to remove consul:traefik/acme/storagefile , verify if we accept invalid certificates in our backend and good luck!
