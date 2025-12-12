# 디렉터리 구조 맞춰서 이미지 파일 및 디렉터리 구조 생성하는 파이썬

import os
import base64

# 1. 생성할 영화 목록 (코드, 제목)
movies = [
    ("mc001", "체인소맨"),
    ("mc002", "더 퍼스트 슬램덩크"),
    ("mc003", "엘리멘탈"),
    ("mc004", "범죄도시3"),
    ("mc005", "오펜하이머"),
    ("mc006", "스즈메의 문단속"),
    ("mc007", "아바타 물의 길"),
    ("mc008", "가디언즈 오브 갤럭시3"),
    ("mc009", "탑건 매버릭"),
    ("mc010", "기생충")
]

# 2. 파일명 목록 (영화당 6개)
filenames = [
    "poster.jpg",
    "bg.jpg",
    "still_001.jpg",
    "still_002.jpg",
    "still_003.jpg",
    "still_004.jpg"
]

# 3. 임시 이미지 데이터 (1x1 픽셀 회색 이미지 - 유효한 JPG 데이터)
# 브라우저에서 엑박이 뜨지 않도록 실제 이미지 데이터를 넣습니다.
dummy_img_b64 = b'/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAP//////////////////////////////////////////////////////////////////////////////////////wgALCAABAAEBAREA/8QAFBABAAAAAAAAAAAAAAAAAAAAAP/aAAgBAQABPxA='
dummy_data = base64.b64decode(dummy_img_b64)

# 4. 저장할 기본 경로 (현재 위치 기준 /images/movie)
base_path = os.path.join("images", "movieImg")

print(f"🚀 디렉터리 및 파일 생성을 시작합니다: {base_path}")

for code, title in movies:
    # 폴더 경로 생성: images/movieImg/mc001
    dir_path = os.path.join(base_path, code)
    
    # 폴더가 없으면 생성
    os.makedirs(dir_path, exist_ok=True)
    
    print(f"[{code}] {title} 폴더 생성 완료")
    
    # 각 폴더 안에 6개의 이미지 파일 생성
    for fname in filenames:
        file_path = os.path.join(dir_path, fname)
        
        # 파일 생성 및 데이터 쓰기
        with open(file_path, "wb") as f:
            f.write(dummy_data)

print("\n✨ 모든 작업이 완료되었습니다! 프로젝트 폴더를 새로고침(F5) 하세요.")