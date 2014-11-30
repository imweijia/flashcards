# <!-- <table>
#     <%@categories.each do |c|%>
#     <tr>
#       <td>
#         <a href ="/categories/
#           <%=c.id%>/posts"><%=c.category_title%>
#         </a>
#           <%end%>
#       </td>
#     </tr>
#   </table>

# </div> -->

Bcrypt::Password.create("woo", :cost =>12)

  # def match_password(password)
  #   encrypted_password == BCrypt::Engine.hash_secret(password,salt)

  # def encrypt_password
  #   unless password.blank?
  #     self.salt = BCrypt::Engine.generate_salt
  #     self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
  #   end
  # end

  # def clear_password
  #   self.password = nil
  # end