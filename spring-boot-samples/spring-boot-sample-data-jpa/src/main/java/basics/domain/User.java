package basics.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "USERS")
public class User {

	@Column(name = "ID")
	private Long id;

	@Id
	@Column(name = "UESRNAME")
	@Length(min = 8, max = 16, message = "Username  must be between 8 to 16 characters.")
	@NotNull(message = "Username not be Empty.")
	private String username;

	@Column(name = "PASSWORD")
	@NotNull
	private String password;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "WALLET")
	private int wallet;

	public User() {

	}

	public User(User user) {
		this.username = user.username;
		this.password = user.password;
		this.email = user.email;
		this.wallet = user.wallet;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getWallet() {
		return wallet;
	}

	public void setWallet(int wallet) {
		this.wallet = wallet;
	}

}
