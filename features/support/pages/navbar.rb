
#ainda ção é a melhor solução
#Navbar é classe que representa a SECAO navbar
class Navbar < SitePrism::Page
    element :nav,'.navbar'
    element :menu_usuario,'a[href="/user_settings dropdown-toggle"]'
    element :link_sair,'a[href$=logout]'

    def desloga
        menu_usuario.click
        link_sair.click
    end
end
