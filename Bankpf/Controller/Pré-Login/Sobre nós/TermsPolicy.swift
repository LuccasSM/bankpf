//
//  TermsPolicy.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 18/05/22.
//

import UIKit

class TermsPolicy: UILabel {
    func text() -> UILabel {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = " O bankpf é um banco único com a finalidade de ser único e diferente para você cliente de toda a américa latina, pois, dentro de nossos serviços, procuramos ser tudo aquilo que não é burocrático. Nós, do bankpf, estamos ligeiramente comprometidos em resguardar de todas as maneiras possíveis a sua privacidade e proteger também nos preocupamos em proteger seus dados pessoais. Queremos assim deixar para você um pouco mais de como tratamos, tudo desde os termos, até todo a sua navegação em nossos serviços. \n\n1. Termos \n\n Ao acessar ao aplicativo bankpf, concorda em cumprir estes termos de serviço, todas as leis e regulamentos aplicáveis e concorda que é responsável pelo cumprimento de todas as leis locais aplicáveis. Se você não concordar com algum desses termos, está proibido de usar ou acessar este aplicativo. Os materiais contidos neste aplicativo são protegidos pelas leis de direitos autorais e marcas comerciais aplicáveis. \n\n2. Uso de Licença \n\n  É concedida permissão para baixar temporariamente uma cópia dos materiais (informações ou software) no aplicativo bankpf, apenas para visualização transitória pessoal e não comercial. Esta é a concessão de uma licença, não uma transferência de título e, sob esta licença, você não pode: \n\n2.1 modificar ou copiar os materiais; \n\n2.2 usar os materiais para qualquer finalidade comercial ou para exibição pública (comercial ou não comercial); \n\n2.3 tentar decompilar ou fazer engenharia reversa de qualquer software contido no aplicativo bankpf; \n\n2.4 remover quaisquer direitos autorais ou outras notações de propriedade dos materiais; \n\n2.5 transferir os materiais para outra pessoa ou 'espelhe' os materiais em qualquer outro servidor. Esta licença será automaticamente rescindida se você violar alguma dessas restrições e poderá ser rescindida por bankpf a qualquer momento. Ao encerrar a visualização desses materiais ou após o término desta licença, você deve apagar todos os materiais baixados em sua posse, seja em formato eletrônico ou impresso. \n\n3. Isenção de responsabilidade \n\n3.1 Os materiais no aplicativo da bankpf são fornecidos 'como estão'. bankpf não oferece garantias, expressas ou implícitas, e, por este meio, isenta e nega todas as outras garantias, incluindo, sem limitação, garantias implícitas ou condições de comercialização, adequação a um fim específico ou não violação de propriedade intelectual ou outra violação de direitos. \n\n3.2 Além disso, o bankpf não garante ou faz qualquer representação relativa à precisão, aos resultados prováveis ou à confiabilidade do uso dos materiais em seu aplicativo ou de outra forma relacionado a esses materiais ou em aplicativos vinculados a este aplicativo. \n\n4.Limitações \n\n  Em nenhum caso o bankpf ou seus fornecedores serão responsáveis por quaisquer danos (incluindo, sem limitação, danos por perda de dados ou lucro ou devido a interrupção dos negócios) decorrentes do uso ou da incapacidade de usar os materiais em bankpf, mesmo que bankpf ou um representante autorizado da bankpf tenha sido notificado oralmente ou por escrito da possibilidade de tais danos. Como algumas jurisdições não permitem limitações em garantias implícitas, ou limitações de responsabilidade por danos consequentes ou incidentais, essas limitações podem não se aplicar a você. \n\n5. Precisão dos materiais \n\n Os materiais exibidos no aplicativo da bankpf podem incluir erros técnicos, tipográficos ou fotográficos. bankpf não garante que qualquer material em seu aplicativo seja preciso, completo ou atual. bankpf pode fazer alterações nos materiais contidos em seu aplicativo a qualquer momento, sem aviso prévio. No entanto, bankpf não se compromete a atualizar os materiais. \n\n6. Links \n\n O bankpf não analisou todos os aplicativos vinculados ao seu aplicativo e não é responsável pelo conteúdo de nenhum aplicativo vinculado. A inclusão de qualquer link não implica endosso por bankpf do aplicativo. O uso de qualquer aplicativo vinculado é por conta e risco do usuário. \n\n7. Modificações \n\n O bankpf pode revisar estes termos de serviço do aplicativo a qualquer momento, sem aviso prévio. Ao usar este aplicativo, você concorda em ficar vinculado à versão atual desses termos de serviço. \n\n8. Lei aplicável \n\n Estes termos e condições são regidos e interpretados de acordo com as leis do bankpf e você se submete irrevogavelmente à jurisdição exclusiva dos tribunais naquele estado ou localidade. Procuramos sempre manter nossa política atualizada.Como diariamente estamos sempre procurando evoluir nossos serviços e nossas Plataformas digitais, esta Política de Privacidade pode estar sempre passando por algumas atualizações, afim é claro de refletir as melhorias realizadas para nossos clientes. Desta forma, recomendamos a visita semanalmente a esta página para que você sempre se mantenha atualizado e tenha um profundo conhecimento sobre as modificações feitas. Caso sejam feitas alterações relevantes, iremos comunicá-lo através de outros meios que lhe chame mais a atenção. \n\n- Atenciosamente. Banco bankpf S.A \n\n"
        text.textColor = .black
        text.font = UIFont(name: "AssociateSans-Light", size: 18)
        text.textAlignment = .justified
        text.numberOfLines = 0
        return text
    }
}
