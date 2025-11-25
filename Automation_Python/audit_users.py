import os

def check_user_audit():
    """Realiza uma auditoria basica em /etc/passwd para identificar riscos de seguranca."""
    print("\n==========================================================")
    print(" AUDITORIA DE SEGURANCA DE USUARIOS | ", os.uname().sysname)
    print("==========================================================")
    
    # Abrir o arquivo de usuarios
    try:
        with open('/etc/passwd', 'r') as f:
            for line in f:
                # Dividir a linha por ':'
                parts = line.split(':')
                username = parts[0]
                user_id = parts[2]
                shell = parts[6].strip()

                # 1. Checagem critica: UID 0 (Root)
                if user_id == '0':
                    print(f"[ALERTA CRITICO] O usuario {username} tem UID 0 (ROOT)!")

                # 2. Checagem de Hardening: Shells inativos/basicos
                if shell == '/bin/sh' or shell == '/sbin/nologin':
                    print(f"[AVISO] Usuario {username} tem um shell basico/inativo: {shell}")
    except FileNotFoundError:
        print("[ERRO] Arquivo /etc/passwd nao encontrado. Executar como root.")
    
    print("\n--- AUDITORIA CONCLUIDA ---")

# Executar a funcao
if __name__ == "__main__":
    check_user_audit()
