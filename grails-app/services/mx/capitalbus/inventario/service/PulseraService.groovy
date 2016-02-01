package mx.capitalbus.inventario.service

import grails.transaction.Transactional
import mx.capitalbus.inventario.domain.CostoPulsera
import mx.capitalbus.inventario.domain.Pulsera
import mx.capitalbus.inventario.domain.PulseraStatus
import mx.capitalbus.inventario.domain.Vendedor

@Transactional
class PulseraService {

    def sessionFactory
    def grailsApplication

    def generatePulseras(Map objeto, Vendedor v) {

        def map = "id_pulsera,codigo,tipo,vendedor,fecha_creacion\n";
        PulseraStatus ps = PulseraStatus.findById(2)
        def fecha = new Date()

        objeto.each { w ->
            def sp = getLastAutoIncrementPulsera();
            for(int i = sp; i< sp + w.value; i++ ){
                int idCod = i * 3;
                def codeEncrypted = encodeId (idCod)
                Pulsera pulsera = new Pulsera()
                pulsera.codigo = codeEncrypted
                pulsera.status = ps
                pulsera.vendedor = v
                pulsera.costoPulsera = CostoPulsera.findById(w.key)
                pulsera.fechaCreacion = fecha

                if (pulsera.validate()) {
                    pulsera.save(flush: true)
                    if (pulsera.id != null){
                        map += pulsera.id +","+pulsera.codigo.toLowerCase().trim() + "," + pulsera.costoPulsera.id + "," + pulsera.vendedor.id + "," + pulsera.fechaCreacion  + "\n"
                    }
                }
            }
        }

        map
    }
    private String encodeId(int id){
        id.encodeAsMD5().encodeAsSHA1().substring(0, 10)
    }

    private String getDatabaseSchema(){
        def dsUrl = grailsApplication.getProperties()
        String dbName = dsUrl.get('flatConfig').get('dataSource.url')
        dbName.substring(dbName.lastIndexOf("/")+1)
    }

    private Integer getLastAutoIncrementPulsera(){
        def session = sessionFactory.currentSession
        def String query = 'SELECT AUTO_INCREMENT FROM information_schema.tables ' +
                'WHERE table_name=\'ct_pulcera\' AND table_schema=\''+getDatabaseSchema()+'\';'
        def sqlQuery = session.createSQLQuery(query)
        (Integer) sqlQuery.uniqueResult()
    }
}
