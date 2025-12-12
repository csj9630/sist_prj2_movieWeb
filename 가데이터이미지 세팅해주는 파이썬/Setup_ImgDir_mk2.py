import os
from PIL import Image, ImageDraw, ImageFont

# ----------------- 설정 변수 -----------------
# 폰트 크기 지정 (원하는 크기로 조정하세요)
FONT_SIZE = 40
# 한글 폰트 경로 지정 (사용자 환경에 맞게 수정)
FONT_PATH = "C:/Windows/Fonts/malgun.ttf"  # Windows 예시 (맑은 고딕)

# ----------------- 데이터 정의 -----------------
movies = [
    # 초기 제공 목록
    # ("mc001", "체인소맨:레제편"),
    # ("mc002", "더 퍼스트 슬램덩크"),
    # ("mc003", "엘리멘탈"),
    # ("mc004", "엣지 오브 투모로우"),
    # ("mc005", "오펜하이머"),
    # ("mc006", "스즈메의 문단속"),
    # ("mc007", "아바타 물의 길"),
    # ("mc008", "가디언즈 오브 갤럭시3"),
    # ("mc009", "탑건 매버릭"),
    # ("mc010", "기생충"),

    # 추가 생성 목록 (mc011 ~ mc050)
    ("mc011", "노량: 죽음의 바다"),
    ("mc012", "서울의 봄"),
    ("mc013", "인사이드 아웃 2"), # 기존 엘리멘탈(mc003)과의 중복을 피하기 위해 대체됨
    ("mc014", "범죄도시3"),
    ("mc015", "한산: 용의 출현"),
    ("mc016", "밀수"),
    ("mc017", "콘크리트 유토피아"),
    ("mc018", "듄 (Dune)"),
    ("mc019", "인터스텔라"),
    ("mc020", "명탐정 코난: 흑철의 어영"),
    ("mc021", "파묘"),
    ("mc022", "아쿠아맨과 로스트 킹덤"),
    ("mc023", "스파이더맨: 어크로스 더 유니버스"),
    ("mc024", "외계+인 2부"),
    ("mc025", "위시"),
    ("mc026", "혹성탈출: 새로운 시대"),
    ("mc027", "베테랑 2"),
    ("mc028", "데드풀과 울버린"),
    ("mc029", "노매드랜드"),
    ("mc030", "테넷 (Tenet)"),
    ("mc031", "라라랜드"),
    ("mc032", "닥터 스트레인지: 대혼돈의 멀티버스"),
    ("mc033", "토이 스토리 4"),
    ("mc034", "킹스맨: 골든 서클"),
    ("mc035", "조커"),
    ("mc036", "보헤미안 랩소디"),
    ("mc037", "어벤져스: 엔드게임"),
    ("mc038", "센과 치히로의 행방불명"),
    ("mc039", "7번방의 선물"),
    ("mc040", "아바타 (Avatar)"),
    ("mc041", "극한직업"),
    ("mc042", "인터스텔라 (재개봉)"),
    ("mc043", "신과함께-죄와 벌"),
    ("mc044", "범죄도시4"),
    ("mc045", "겨울왕국 2"),
    ("mc046", "웡카"),
    ("mc047", "미션 임파서블: 데드 레코닝 PART ONE"),
    ("mc048", "명량"),
    ("mc049", "겨울왕국"),
    ("mc050", "베놈 2: 렛 데어 비 카니지")
]

filenames_with_size = {
    "poster.jpg": (500, 700),
    "bg.jpg": (1920, 400),
    "still_001.jpg": (800, 600),
    "still_002.jpg": (800, 600),
    "still_003.jpg": (800, 600),
    "still_004.jpg": (800, 600),
    "still_005.jpg": (700, 1000),
    "still_006.jpg": (700, 1000)
}

base_path = os.path.join("images", "movieImg")

# ----------------- 폰트 로드 -----------------
try:
    # 지정된 경로의 폰트를 지정된 크기로 로드
    font = ImageFont.truetype(FONT_PATH, FONT_SIZE)
    print(f"✅ 폰트 로드 성공: {FONT_PATH}, 크기: {FONT_SIZE}")
except IOError:
    # 폰트 경로를 찾지 못하거나 로드에 실패하면 기본 폰트 사용 (한글 깨질 수 있음)
    font = ImageFont.load_default()
    print("⚠️ 지정된 폰트 파일을 찾을 수 없어 기본 폰트를 사용합니다. (한글 깨짐 주의)")
    
# ----------------- 이미지 생성 시작 -----------------
print(f"🚀 디렉터리 및 이미지 생성을 시작합니다: {base_path}")

for code, title in movies:
    dir_path = os.path.join(base_path, code)
    os.makedirs(dir_path, exist_ok=True)
    
    print(f"\n[{code}] {title} 폴더 생성 완료")
    
    for original_fname, (width, height) in filenames_with_size.items():
        # B 방식으로 파일명 생성: [코드]_[이름].[확장자]
        name, ext = os.path.splitext(original_fname)
        new_fname = f"{code}_{name}{ext}" 
        file_path = os.path.join(dir_path, new_fname)
        
        # 이미지 생성 (밝은 회색 배경)
        img = Image.new('RGB', (width, height), color = '#EFEFEF')
        draw = ImageDraw.Draw(img)
        
        # 문구 설정
        text1 = f"{title}"
        text2 = f"코드: {code} / 파일: {new_fname}"
        text3 = f"크기: {width} x {height}"
        text_color = "black"
        
        # 텍스트 그리기 위치 계산 (이미지 중앙)
        text_lines = [text1, text2, text3]
        total_text_height = 0
        
        # 각 줄의 텍스트 크기를 계산하여 전체 높이 파악
        line_infos = []
        for text in text_lines:
            # 텍스트 크기 계산 (Pillow 9.0.0 이후 textbbox 권장)
            bbox = draw.textbbox((0, 0), text, font=font)
            text_width = bbox[2] - bbox[0]
            text_height = bbox[3] - bbox[1]
            line_infos.append((text, text_width, text_height))
            total_text_height += text_height + 10  # 줄 간격 10px 추가
        
        # 첫 줄의 시작 Y 좌표 계산 (전체 텍스트 블록을 이미지 중앙에 위치시키기 위함)
        start_y = (height / 2) - (total_text_height / 2)
        
        current_y = start_y
        
        # 모든 줄 그리기
        for text, text_width, text_height in line_infos:
            x = (width - text_width) / 2 # 중앙 정렬 X 좌표
            draw.text((x, current_y), text, fill=text_color, font=font)
            current_y += text_height + 10 # 다음 줄로 이동
        
        # 이미지 저장
        img.save(file_path, 'JPEG')
        
    print(f"  -> 이미지 6개 생성 완료.")

print("\n✨ 모든 작업이 완료되었습니다!")