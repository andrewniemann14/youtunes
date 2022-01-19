package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Artist;
import idklol.JdbcManager;

public class JdbcArtistDao implements ArtistDao {
	
	JdbcManager db;
	
	public JdbcArtistDao() {
		db = new JdbcManager();
	}

	@Override
	public void add(Artist entity) {
		Connection conn = db.getConn();
		Artist newArtist = entity;
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "INSERT INTO artist(name) VALUES('" + newArtist.getName() + "')";
				
				System.out.println(sql);
				
				try {
					stmt.executeUpdate(sql);
				} finally {
					stmt.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}
		
	}

	@Override
	public List<Artist> list() {
		Connection conn = db.getConn();
		ArrayList<Artist> artists = new ArrayList<Artist>();
		
		if (conn != null) {
			try {
				Statement stmnt = conn.createStatement();
				String sql = "select artist_id, name from artist";
				
				try {
					ResultSet rs = stmnt.executeQuery(sql);
					try {
						while (rs.next()) {
							Artist artist = new Artist();
							artist.setID(rs.getLong(1));
							artist.setName(rs.getString(2));
							artists.add(artist);
						}
					} finally {
						rs.close();
					}
				} finally {
						stmnt.close();
				}
			} catch (SQLException ex) {
					System.out.println(ex.getMessage());
			} finally {
					db.closeConn(conn);
			}
		}
		return artists;
	}


	@Override
	public Artist find(Long key) {
		Connection conn = db.getConn();
		Artist artist = null;
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "SELECT artist_id, name FROM artist WHERE artist_id =" + key;
				
				try {
					ResultSet rs = stmt.executeQuery(sql);
					
					try {
						if (rs.next()) {
							artist = new Artist(rs.getLong(1), rs.getString(2));
						}
					} finally {
						rs.close();
					}
				} finally {
					stmt.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}
		return artist;
	}

	@Override
	public void update(Artist entity) {
		Connection conn = db.getConn();
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "UPDATE artist SET name = '" + entity.getName() + "' WHERE artist_id = " + entity.getID();
				System.out.println(sql);
				
				try {
					stmt.executeUpdate(sql);
				} finally {
					stmt.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}

	}

	@Override
	public void remove(Long key) {
		Connection conn = db.getConn();
		
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				String sql = "DELETE FROM artist WHERE artist_id = " + key;
				System.out.println(sql);
				
				try {
					stmt.executeUpdate(sql);
				} finally {
					stmt.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}

	}

}
