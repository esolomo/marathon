# -*- mode: ruby -*-
# vi: set ft=ruby :

def gen_node_infos(cluster_yml)
  master_n = cluster_yml['master_n']
  master_mem = cluster_yml['master_mem']
  master_cpus = cluster_yml['master_cpus']
  slave_n = cluster_yml['slave_n']
  slave_mem = cluster_yml['slave_mem']
  slave_cpus = cluster_yml['slave_cpus']
  infra_n = cluster_yml['infra_n']
  infra_mem = cluster_yml['infra_mem']
  infra_cpus = cluster_yml['infra_cpus']
  zk_n = cluster_yml['zk_n']
  zk_mem = cluster_yml['zk_mem']
  zk_cpus = cluster_yml['zk_cpus']
  master_ipbase = cluster_yml['master_ipbase']
  slave_ipbase = cluster_yml['slave_ipbase']
  infra_ipbase = cluster_yml['infra_ipbase']
  zk_ipbase = cluster_yml['zk_ipbase']
  zk_instance_type = cluster_yml['zk_instance_type']
  master_instance_type = cluster_yml['master_instance_type']
  slave_instance_type = cluster_yml['slave_instance_type']
  infra_instance_type = cluster_yml['infra_instance_type']

  master_infos = (1..master_n).map do |i|
                   { :hostname => "master#{i}",
                     :ip => master_ipbase + "#{10+i}",
                     :mem => master_mem,
                     :cpus => master_cpus,
                     :instance_type => master_instance_type
                   }
                 end
  slave_infos = (1..slave_n).map do |i|
                   { :hostname => "slave#{i}",
                     :ip => slave_ipbase + "#{10+i}",
                     :mem => slave_mem,
                     :cpus => slave_cpus,
                     :instance_type => slave_instance_type
                   }
                 end
  infra_infos = (1..infra_n).map do |i|
                   { :hostname => "infra#{i}",
                     :ip => infra_ipbase + "#{10+i}",
                     :mem => infra_mem,
                     :cpus => infra_cpus,
                     :instance_type => infra_instance_type
                   }
                 end
  all_slave_infos = slave_infos

  all_slave_infos.push(infra_infos[0])

  zk_infos = (1..zk_n).map do |i|
               { :hostname => "zk#{i}",
                 :ip => zk_ipbase + "#{10+i}",
                 :mem => zk_mem,
                 :cpus => zk_cpus,
                 :instance_type => zk_instance_type
               }
             end

  return { :master => master_infos, :slave=>slave_infos, :infra=>infra_infos, :zk=>zk_infos, :all_slaves =>all_slave_infos }
end
